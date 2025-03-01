# Use the official OpenJDK image as a base
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Compile the Java application
RUN javac -d . src/Main.java

# Set the command to run your Java application
CMD ["java", "Main"]