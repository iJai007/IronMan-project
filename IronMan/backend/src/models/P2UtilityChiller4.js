const mongoose = require('mongoose');
const p2_utility_chiller4 = mongoose.Schema({
    User_id :{
        type:String,
    },
    Comp1_Status :{
        type:String,
        //required:true,
    },
    Comp1_Load_Percent:{
        type:String,
        //required:true,
    },
    Comp2_Status:{
        type:String,
        //required:true,
    },
    Comp2_Load_Percent:{
        type:String,
        //required:true,
    },
    Comp3_Status:{
        type:String,
        //required:true,
    },
    Comp3_Load_Percent:{
        type:String,
        //required:true,
    }, 
    Evaporator_Inlet:{
        type:String,
        //required:true,
    },
    Evaporator_Outlet:{
        type:String,
        //required:true,
    },
    Evaporator_Delta_T:{
        type:String,
        //required:true,
    },
    Evaporator_Approach:{
        type:String,
        //required:true,
    },
    Condensor_Inlet:{
        type:String,
        //required:true,
    },
    Condensor_Outlet :{
        type:String,
        //required:true,
    },
    Condensor_Delta_T:{
        type:String,
        //required:true,
    },
    Condensor_Approach:{
        type:String,
        //required:true,
    },
    Compressor_Run_Hrs_Comp_1:{
        type:String,
        //required:true,
    },
    Compressor_Run_Hrs_Comp_2:{
        type:String,
        //required:true,
    },
    Compressor_Run_Hrs_Comp_3 :{
        type:String,
        //required:true,
    },    Comp_1_Discharge_Pressure:{
        type:String,
        //required:true,
    },
    Comp_1_Discharge_Temp :{
        type:String,
        //required:true,
    },    Comp_1_Motor_Current:{
        type:String,
        //required:true,
    },
    Comp_1_Lift_Temp :{
        type:String,
        //required:true,
    },    Comp_2_Discharge_Pressure:{
        type:String,
        //required:true,
    },
    Comp_2_Discharge_Temp :{
        type:String,
        //required:true,
    },    Comp_2_Motor_Current :{
        type:String,
        //required:true,
    },    Comp_2_Lift_Temp :{
        type:String,
        //required:true,
    },    Comp_3_Discharge_Pressure :{
        type:String,
        //required:true,
    },    Comp_3_Discharge_Temp:{
        type:String,
        //required:true,
    },
    Comp_3_Motor_Current:{
        type:String,
        //required:true,
    },
    Comp_3_Lift_Temp :{
        type:String,
        //required:true,
    },    Exv_Liquid_Temp :{
        type:String,
        //required:true,
    },    Exv_Suction_Pressure :{
        type:String,
        //required:true,
    },    Exv_Suction_Temperature :{
        type:String,
        //required:true,
    },    Exv_Suction_Saturation_Temperature:{
        type:String,
        //required:true,
    },
    Exv_Suction_Superheat:{
        type:String,
        //required:true,
    },
    Exv_Output_Percentage :{
        type:String,
        //required:true,
    },    Water_Leakages :{
        type:String,
        //required:true,
    },    Abnormal_Sound :{
        type:String,
        //required:true,
    },    Secondary_Pump_Discharge_Pressure :{
        type:String,
        //required:true,
    },    Cond_Water_Flow:{
        type:String,
        //required:true,
    },
    Evap_Water_Flow :{
        type:String,
        //required:true,
    },    Wet_Bulb_Temp :{
        type:String,
        //required:true,
    },    Ambient_Temp :{
        type:String,
        //required:true,
    },    Chw_Shop_Supply_Temperature :{
        type:String,
        //required:true,
    },    Chw_Shop_Return_Temp :{
        type:String,
        //required:true,
    }
});
const p2uc4 = mongoose.model("p2uc4",p2_utility_chiller4);
module.exports = p2uc4;