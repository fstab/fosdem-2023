package de.fstab.demo.greeting;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.util.Random;

import static de.fstab.demo.common.TaskSimulator.randomError;
import static de.fstab.demo.common.TaskSimulator.randomSleep;

@RestController
public class GreetingController {

	private final Random random = new Random(0);

	@GetMapping("/greeting")
	public String getGreeting() throws Exception {
		if (random.nextDouble() < 0.6) {
			// 60% of requests are served from a cache, these are fast.
			randomSleep(Duration.ofMillis(500));
		} else {
			// 20% of requests are served from the db, these are slow.
			randomSleep(Duration.ofMillis(1500));
		}
		randomError(0.1);
		return "Hello, World!";
	}
}