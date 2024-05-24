const mongoose = require('mongoose');
const UserSchema = mongoose.Schema({
    UserName:{
        type:String,
        //required:true,
    },
    Phone:{
        type:String,
        //required:true,
    },
    Address:{
        type:String,
        //required:true,
    },
    Area:{
        type:String,
        //required:true,
    },
    Pincode:{
        type:String,
        //required:true,
    },
    Password:{
        type:String,
        //required:true,
    },
});
const UserModel = mongoose.model("User",UserSchema);
module.exports = UserModel;