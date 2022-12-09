package de.fstab.demo.common;

import java.io.IOException;
import java.time.Duration;
import java.util.Random;

public class TaskSimulator {

    private static final Random random = new Random(0);

    public static void randomSleep(Duration averageDuration) throws InterruptedException{
        long sleepTime;
        do {
            sleepTime = averageDuration.toMillis() + (long) (random.nextGaussian() * 200);
        } while (sleepTime <= 0.0);
        Thread.sleep(sleepTime);
    }

    public static void randomError(double probability) throws IOException {
        if (random.nextDouble() < probability) {
            throw new IOException("random error");
        }
    }
}
