package de.fstab.demo.otel;

import com.google.auto.service.AutoService;
import io.opentelemetry.sdk.autoconfigure.spi.AutoConfigurationCustomizer;
import io.opentelemetry.sdk.autoconfigure.spi.AutoConfigurationCustomizerProvider;
import io.opentelemetry.sdk.metrics.Aggregation;
import io.opentelemetry.sdk.metrics.InstrumentSelector;
import io.opentelemetry.sdk.metrics.View;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@AutoService(AutoConfigurationCustomizerProvider.class)
public class HistogramConfigurer implements AutoConfigurationCustomizerProvider {

    @Override
    public void customize(AutoConfigurationCustomizer autoConfiguration) {
        List<Double> bucketBoundaries = new ArrayList<>();
        for (double d=200.0; d<=3000; d += 200.0) {
            bucketBoundaries.add(d);
        }
        autoConfiguration.addMeterProviderCustomizer((sdkMeterProviderBuilder, configProperties) -> sdkMeterProviderBuilder.registerView(
                InstrumentSelector.builder()
                        .setName("http.server.duration")
                        .build(),
        View.builder()
                        .setAggregation(Aggregation.explicitBucketHistogram(bucketBoundaries))
                        .build()));
    }
}