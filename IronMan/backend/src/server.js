const express = require('express');
const app = express();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const multer = require('multer');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('uploads'));

mongoose.connect("mongodb+srv://jaideeparunsr:z0rdSBSH3bPjRwY2@cluster0.fmq0pod.mongodb.net/IronMan").then(function() {
//NLnB2vd9UQrXL9ac
//gN7za480EO6HT713
    app.get("/", function(req, res) {
        res.send("IronMan backend");
    });

    const userRoutes = require('./routes/user_routes');
    app.use("/api/shops", userRoutes);

});

const PORT = 5000
app.listen(PORT, function() {
    console.log(`Server started at PORT: ${PORT}`);
});

//mongodb+srv://jaideeparunsr:<password>@cluster0.fmq0pod.mongodb.net/