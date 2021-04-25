package com.bbtutorials.echo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EchoController {

	@GetMapping("/")
    public String echo() {
        return "{ \"hello\": \"world\"  }";
    }

	@GetMapping("/echo/{name}")
    public String echo(@PathVariable String name) {
        return "Hello " + name;
    }

}
