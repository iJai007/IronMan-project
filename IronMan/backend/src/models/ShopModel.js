

const mongoose = require('mongoose');
const ShopSchema = mongoose.Schema({
    Name:{
        type:String,
        //required:true,
    },
    Services:{
        type:Array,
        //required:true,
    },
    Cost:{
        type:Object,
        //required:true,
    },
    Area:{
        type:String,
        //required:true,
    },
});
const ShopModel = mongoose.model("Shops",ShopSchema);
module.exports = ShopModel;