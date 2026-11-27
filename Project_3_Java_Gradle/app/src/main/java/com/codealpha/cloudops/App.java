package com.codealpha.cloudops;

public class App {

    public String getApplicationName() {
        return "CloudOps Java Build Monitor";
    }

    public String getVersion() {
        return "1.0.0";
    }

    public String getBuildStatus() {
        return "SUCCESS";
    }

    public String getJavaVersion() {
        return System.getProperty("java.version");
    }

    public String getGreeting() {
        return "Build monitoring initialized successfully.";
    }

    public static void main(String[] args) {

        App app = new App();

        System.out.println("====================================");
        System.out.println("       CLOUDOPS BUILD MONITOR");
        System.out.println("====================================");
        System.out.println("Application: " + app.getApplicationName());
        System.out.println("Version: " + app.getVersion());
        System.out.println("Build Status: " + app.getBuildStatus());
        System.out.println("Java Version: " + app.getJavaVersion());
        System.out.println("====================================");
        System.out.println(app.getGreeting());
    }
}