package com.example.helloworld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    private int counter = 0;

    @GetMapping("/")
    public String helloWorld() {
        counter++;
        return "hello-world-" + counter;
    }
}
