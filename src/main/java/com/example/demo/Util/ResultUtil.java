package com.example.demo.Util;

import com.example.demo.Enum.CodeEnum;
import com.example.demo.Response.Result;
public class ResultUtil  {

    public static Result success(Object object){
        Result result=new Result();
        result.setCode(200);
        result.setMsg("成功");
        result.setData(object);
        return result;
    }

    public static Result success(){
        return success(null);
    }

    public static Result error(CodeEnum codeEnum){
        Result result=new Result();
        result.setCode(codeEnum.getCode());
        result.setMsg(codeEnum.getMsg());
        return result;
    }
}
