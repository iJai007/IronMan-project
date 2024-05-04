const router = require('express').Router();
const shopModel = require('../models/ShopModel');
const orderModel = require('../models/OrderModel');
const bcrypt = require('bcrypt');
const jsonwebtoken = require('jsonwebtoken');
const jwt = require('./../middlewares/jwt');
const { json } = require('express');
const UserModel = require('../models/UserModel');
const OrderModel = require('../models/OrderModel');
const mongoose = require('mongoose');
const { EventEmitter } = require('events');

const eventEmitter = new EventEmitter(); 
const clients = new Map();

router.post("/createShop", async function(req, res) {
    const shopData = req.body;

    // Create the JWT Token
    const token = await jsonwebtoken.sign({ Name: shopData.Name }, "thisismysecretkey");
    shopData.token = token;

    const newShop = new shopModel(shopData);
    await newShop.save(function(err) {
        if(err) {
            res.json({ success: false, error: err });
            console.log("Shop not created");
            return;
        }
        console.log("Shop created");
        res.json({ success: true, data: newShop });
    });
});

router.post("/getShop", async function(req, res) {
    const id = req.body.Area;
    const foundShops = await shopModel.find();
    res.json( foundShops );
    console.log("Shops Found");
});
/*
router.post("/placeOrder", async function(req, res) {
    const orderData =  req.body;
    console.log(orderData);
    // Create the JWT Token
    const token = await jsonwebtoken.sign({ Name: orderData.UserID }, "thisismysecretkey");
    console.log(token);
    orderData.token = token;

    const newOrder = new orderModel(orderData);
    /*await newOrder.save(function(err) {
        if(err) {
            res.json({ success: false, error: err });
            console.log("Order not created");
            return;
        }
        console.log("Order created");
        res.json({ success: true, data: newOrder });
    });
    try{ 
        let output = await newOrder.save()
        console.log(output)
        const shopName = orderData.ShopName
        if(!shopName) {
            res.status(400).json({ success: false, error: 'UserID is required' });
            return;
          }
          const client = clients.get(shopName);
          console.log(client+'me')
          if (client) {
            client.write(`data: ${JSON.stringify({ message: 'New order placed'})}\n\n`);
            res = client.res;
            console.log(client.res)
            res.json({'newOrder':'true'});
            console.log(`data: ${JSON.stringify({ message: 'New order placed'})}\n\n`)
        }
        res.json({ success: true});
    }
    catch(err){
        res.json({ success: false, error: err })
    }
});
router.get('/events', (req,res)=>{
    const shopName = req.query.shopName;
    if (!shopName) {
        res.status(400).end('userId parameter is required');
        return;
      }
    
    res.setHeader('Content-Type', 'text/event-stream');
  res.setHeader('Cache-Control', 'no-cache');
  res.setHeader('Connection', 'keep-alive');
  clients.set(shopName, res);
      console.log(shopName)
  // Clean up when client disconnects
  req.on('close', () => {
    console.log(shopName + 'disconnected')
    clients.delete(shopName);

  });

});*/ //mycode

router.get('/events', (req, res) => {
    const shopName = req.query.shopName;

    // Check if shopName is provided
    if (!shopName) {
        res.status(400).end('ShopName parameter is required');
        return;
    }

    // Set headers for SSE
    res.setHeader('Content-Type', 'text/event-stream');
    res.setHeader('Cache-Control', 'no-cache');
    res.setHeader('Connection', 'keep-alive');

    // Store the response object (res) in the clients map
    clients.set(shopName, res);

    // Clean up when client disconnects
    req.on('close', () => {
        console.log(shopName + ' disconnected');
        clients.delete(shopName);
    });
});

router.post("/placeOrder", async function(req, res) {
    const orderData = req.body;

    // Create a new order document
    const newOrder = new orderModel(orderData);
    
    try { 
        let output = await newOrder.save();
        //console.log(output);

        const shopName = orderData.ShopName;
        console.log(shopName)
        // Check if shopName is provided
        if (!shopName) {
            res.status(400).json({ success: false, error: 'ShopName is required' });
            return;
        }

        // Get the client corresponding to the shopName from the clients map
        const client = clients.get(shopName);

        console.log('here1'+ clients )
        // Check if client is found
        if (client) {
            // Send SSE message to the client
            
            console.log('here' )
            client.json('New Order Placed');
        }

        // Send response to the client who placed the order
        res.json({ success: true });
    } catch(err) {
        res.json({ success: false, error: err });
    }
});


router.post("/getOrder", async function(req, res) {
    const shopName = req.body.shopData
    const orders = await orderModel.find({'ShopName':shopName});
    res.json( orders );
    console.log("Shops Found");
    
});

router.post("/updateOrderStatus", async function(req,res){
    const orderData = req.body.data;
    const id = req.body.id;
   const updateOrder = new OrderModel(orderData);
   try{
    let output = await updateOrder.updateOne({'_id':id},orderData)
   }
   catch(err){
    res.json({success: false, error: err})
   }
});

router.post("/createUser", async function(req, res) {
    const userData = req.body.Data;
    const OTP = req.body.OTP;
    if(OTP == '000000'){
    // Create the JWT Token
    const token = await jsonwebtoken.sign({ Name: userData.Name }, "thisismysecretkey");
    userData.token = token;

    const newUser = new UserModel(userData);
    await newUser.save(function(err) {
        if(err) {
            res.json({ success: false, error: err });
            console.log("User not created");
            return;
        }
        console.log("User created");
        res.json({ success: true, data: newUser });
    });}
    else{
        res.json({success : false});
    }
});

router.post("/getOTP", function(req,res) {
    const num = req.body.num;
    
})
router.post("/login", async function(req, res) {
    const id = req.body.Docid;
    const password = req.body.DocPass;
    //new line
    const foundUser = await ShopModel.findOne({ Docid :  id });
    if(!foundUser) {
        res.json({ success: false, error: "user-not-found" });
        console.log("User not found")
        console.log("Login fail");
        return;
    }

    //const correctPassword = await bcrypt.compare(password, foundUser.password);
    
    if(foundUser.DocPass != password ) {
        res.json({ success: false, error: "incorrect-password" });
        console.log("Login fail");
        return;
    }

    res.json({ success: true, data: foundUser });
    console.log("Login Success");
});



module.exports = router;