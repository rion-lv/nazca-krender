import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	id("org.springframework.boot") version "2.4.3"
	id("io.spring.dependency-management") version "1.0.11.RELEASE"
	war
	idea
	kotlin("jvm") version "1.4.30"
	kotlin("plugin.spring") version "1.4.30"
}

group = "com.levvels.nazca.render"
java.sourceCompatibility = JavaVersion.VERSION_11
repositories {
	mavenCentral()
}

dependencies {

	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation ("org.springframework.boot:spring-boot-starter-freemarker")
	implementation("org.springframework.boot:spring-boot-starter-actuator")
	implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-allopen")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
	implementation ("com.googlecode.json-simple:json-simple:1.1.1")
	implementation ("com.squareup.okhttp3:okhttp:4.0.1")
	annotationProcessor("org.springframework.boot:spring-boot-configuration-processor")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
	implementation("com.jayway.jsonpath:json-path:2.4.0")
	implementation("io.github.microutils:kotlin-logging:1.6.24")
	implementation("org.apache.commons:commons-lang3:3.5")
	implementation("net.logstash.logback:logstash-logback-encoder:5.0")
	implementation("org.springframework.boot:spring-boot-devtools")
	implementation ("io.sentry:sentry-spring-boot-starter:6.5.0")
	implementation ("io.sentry:sentry-logback:6.5.0")
	runtimeOnly ("com.github.danielwegener:logback-kafka-appender:0.2.0-RC2")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "11"
	}
}

tasks.withType<Test> {
	useJUnitPlatform()
}

tasks.processResources{
	doLast {
		copy {
			from("libs")
			into("${buildDir}/libs")
			include("**/*")
		}
	}
}