const router = require('express').Router();
const shopModel = require('../models/ShopModel');
const orderModel = require('../models/OrderModel');
const bcrypt = require('bcrypt');
const jsonwebtoken = require('jsonwebtoken');
const jwt = require('./../middlewares/jwt');
const { json } = require('express');
const UserModel = require('../models/UserModel');


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

router.post("/placeOrder", async function(req, res) {
    const orderData =  req.body;

    // Create the JWT Token
    const token = await jsonwebtoken.sign({ Name: orderData.UserID }, "thisismysecretkey");
    orderData.token = token;

    const newOrder = new orderModel(orderData);
    await newOrder.save(function(err) {
        if(err) {
            res.json({ success: false, error: err });
            console.log("Order not created");
            return;
        }
        console.log("Order created");
        res.json({ success: true, data: newOrder });
    });
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