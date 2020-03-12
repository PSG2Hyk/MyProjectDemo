package com.example.demo.Controller;

import com.UpYun;
import com.example.demo.Response.Result;
import com.example.demo.Util.ResultUtil;
import com.upyun.UpException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/image")
public class ImageController {
    @PostMapping("/upload")
    public Result upload(@RequestParam("file_data") MultipartFile multipartFile) throws IOException, UpException {
        UpYun upYun =new UpYun("image-hyk","hyk","AFjVMHZP7X14o1CIHKnLNYlbVqUvUNXh");

        String fileName=String.format("%s.%s",
                UUID.randomUUID().toString(),
                multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1));

        upYun.writeFile(fileName,multipartFile.getInputStream(),true,new HashMap<>());

        Map map=new HashMap<>();
        map.put("fileName",fileName);
        map.put("fileUrl","http://image-hyk.test.upcdn.net"+"/"+fileName);
        return ResultUtil.success(map);
    }
}
