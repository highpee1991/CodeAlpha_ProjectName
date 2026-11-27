package com.codealpha.cloudops;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AppTest {

    private final App app = new App();

    @Test
    void applicationShouldHaveCorrectName() {
        assertEquals("CloudOps Java Build Monitor", app.getApplicationName());
    }

    @Test
    void applicationShouldHaveCorrectVersion() {
        assertEquals("1.0.0", app.getVersion());
    }

    @Test
    void buildStatusShouldBeSuccessful() {
        assertEquals("SUCCESS", app.getBuildStatus());
    }

    @Test
    void javaVersionShouldNotBeEmpty() {
        assertFalse(app.getJavaVersion().isEmpty());
    }

    @Test
    void applicationShouldReturnGreeting() {
        assertEquals(
            "Build monitoring initialized successfully.",
            app.getGreeting()
        );
    }
}