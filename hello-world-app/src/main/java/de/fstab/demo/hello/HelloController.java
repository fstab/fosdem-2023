package de.fstab.demo.hello;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;

import static de.fstab.demo.common.TaskSimulator.randomError;
import static de.fstab.demo.common.TaskSimulator.randomSleep;

@RestController
public class HelloController {

    @Value("${greeting.service.port}")
    private int greetingServicePort;

    private final OkHttpClient client = new OkHttpClient();
    /*

    // some examples of custom metrics and spans, not used in the demo

    private final LongCounter customCounter;

    public HelloController(LongCounter customCounter) {
        this.customCounter = customCounter;
    }

    // Increment a custom counter metric. Not used in the demo.
    private void incrementCustomCounter() {
        Attributes attributes = Attributes.of(stringKey("my.custom.key"), "my.custom.value");
        customCounter.add(1, attributes);
    }

    // Add a custom event to traces. Not used in the demo.
    private void addCustomEvent() {
        Span.current().addEvent("Fabian's Event");
    }

    // Add a custom attribute to the current span. Not used in the demo.
    private void addCustomAttribute() {
        Span.current().setAttribute("fabian.attr.key", "fabian.attr.value");
    }

    // Start a custom Span. Not used in the demo.
    private Span startCustomInternalSpan() {
        Tracer tracer = GlobalOpenTelemetry.get().getTracer("my-custom-instrumentation", "1.0.0");
        return tracer.spanBuilder("fabian's child")
                .setParent(Context.current().with(Span.current()))
                .startSpan();
    }
     */

    @GetMapping("/")
    public String sayHello() throws Exception {
        //incrementCustomCounter();
        //addCustomEvent();
        //addCustomAttribute();
        //Span customSpan = startCustomInternalSpan();
        //try {
        randomSleep(Duration.ofMillis(500));
        //} finally {
        //    customSpan.end();
        //}
        randomError(0.1);
        Request request = new Request.Builder().url("http://localhost:" + greetingServicePort + "/greeting").build();
        try (Response response = client.newCall(request).execute()) {
            return response.body().string() + "\n";
        }
    }
}
