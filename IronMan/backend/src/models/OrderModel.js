const mongoose = require('mongoose');
const OrderSchema = mongoose.Schema({
    UserID:{
        type:String,
        //required:true,
    },
    UserName:{
        type:String,
        //required:true,
    },
    ShopName:{
        type:String,
        //required:true,
    },
    OrderDateTime:{
        type:String,
        //required:true,
    },
    Services:{
        type:Object,
        //required:true,
    },
    Cost:{
        type:String,
        //required:true,
    },
});
const OrderModel = mongoose.model("Order",OrderSchema);
module.exports = OrderModel;