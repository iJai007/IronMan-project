const router = require('express').Router();
const ShopModel = require('../models/ShopModel');
const UserModel = require('../models/Pat_model')
const bcrypt = require('bcrypt');
const jsonwebtoken = require('jsonwebtoken');
const jwt = require('./../middlewares/jwt');


router.post("/createShop", async function(req, res) {
    const shopData = req.body;

    // Create the JWT Token
    const token = await jsonwebtoken.sign({ Name: shopData.Name }, "thisismysecretkey");
    shopData.token = token;

    const newShop = new ShopModel(shopData);
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
    const foundShops = await ShopModel.find();
    res.json( foundShops );
    console.log("Shops Found");
});


router.post("/p2u/login/chiller4AddData", async function(req, res) {
    const Data = req.body;
    // Create the JWT Token
    const token = await jsonwebtoken.sign({ User_id: Data.User_id }, "thisismysecretkey");
    Data.token = token;

    const newData = new ShopModel(Data);
    await newData.save(function(err) {
        if(err) {
            res.json({ success: false, error: err });
            console.log("Data not saved");
            return;
        }
        console.log("Data saved");
        res.json({ success: true, data: newData });
    });
});
router.post("/createPat", async function(req, res) {
    const PatData = req.body;

    // Encrypt(Hash) the password
    /*const password = PatData.PatPass;
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);
    PatData.PatPass = hashedPassword;
    */
    // Create the JWT Token
    const token = await jsonwebtoken.sign({ Patid: PatData.Patid }, "thisismysecretkey");
    PatData.token = token;

    const newUser = new UserModel(PatData);
    await newUser.save(function(err) {
        if(err) {
            res.json({ success: false, error: err });
            console.log("User not created");
            return;
        }
        console.log("User created");
        res.json({ success: true, data: newUser });
    });
});

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



router.put("/", async function(req, res) {
    const shopData = req.body;
    const userid = shopData.userid;

    const result = await ShopModel.findOneAndUpdate({ userid: userid }, shopData);

    if(!result) {
        res.json({ success: false, error: "user-not-found" });
        return;
    }

    res.json({ success: true, data: shopData });
});


module.exports = router;