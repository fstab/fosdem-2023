package de.fstab.demo.hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CommonsRequestLoggingFilter;

@SpringBootApplication
@Configuration
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	public CommonsRequestLoggingFilter logFilter() {
		CommonsRequestLoggingFilter filter = new CommonsRequestLoggingFilter();
		filter.setIncludeQueryString(true);
		filter.setIncludeHeaders(true);
		filter.setIncludeClientInfo(true);
		return filter;
	}

	/*

	// custom metrics, not used in this demo

	@Bean
	public LongCounter customCounter(Meter meter) {
		return meter
				.counterBuilder("my.custom.counter")
				.setDescription("Custom Counter")
				.setUnit("1")
				.build();
	}

	@Bean
	public Meter getMeter() {
		// GlobalOpenTelemetry.get() is modified by the instrumentation agent, so we get the
		// same instance here that the agent uses internally for auto-instrumentation.
		return GlobalOpenTelemetry.get()
				.meterBuilder("my-custom-instrumentation")
				.setInstrumentationVersion("1.0.0")
				.build();
	}
	 */
}
