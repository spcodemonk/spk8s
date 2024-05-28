package com.spk8s.spk8s;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/first")
public class FirstController {
    @GetMapping("/a")
    public String getHello(){
        return "Hello Sharad! Kubernetes is working with deployment file";
    }
}
