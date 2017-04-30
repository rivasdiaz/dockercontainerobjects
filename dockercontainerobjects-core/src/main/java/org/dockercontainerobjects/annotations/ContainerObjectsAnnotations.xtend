package org.dockercontainerobjects.annotations

import java.lang.^annotation.Documented
import java.lang.^annotation.Inherited
import java.lang.^annotation.Repeatable
import java.lang.^annotation.Retention
import java.lang.^annotation.Target
import javax.inject.Qualifier

@Documented
@Retention(RUNTIME)
@Target(#[FIELD, PARAMETER])
@Inherited
annotation ContainerObject {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation BeforeCreating {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation AfterCreated {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation BeforeStarting {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation AfterStarted {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation BeforeStopping {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation AfterStopped {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation BeforeRemoving {}

@Documented
@Retention(RUNTIME)
@Target(METHOD)
@Inherited
annotation AfterRemoved {}

@Documented
@Retention(RUNTIME)
@Target(FIELD)
@Inherited
@Qualifier
annotation ContainerId {}

@Documented
@Retention(RUNTIME)
@Target(FIELD)
@Inherited
@Qualifier
annotation ContainerAddress {}

@Documented
@Retention(RUNTIME)
@Target(#[TYPE, METHOD])
@Inherited
annotation RegistryImage {
    String value = ''
    boolean forcePull = false
    boolean autoRemove = false
}

@Documented
@Retention(RUNTIME)
@Target(#[TYPE, METHOD])
@Inherited
annotation BuildImage {
    String value = ''
    String tag = ''
    boolean forcePull = false
}

@Documented
@Retention(RUNTIME)
@Target(TYPE)
@Inherited
annotation Environment {
    EnvironmentEntry[] value = #[]
}

@Documented
@Retention(RUNTIME)
@Target(TYPE)
@Inherited
@Repeatable(Environment)
annotation EnvironmentEntry {
    String key = ''
    String value = ''
}

@Documented
@Retention(RUNTIME)
@Target(#[TYPE, METHOD])
@Inherited
annotation BuildImageContent {
    BuildImageContentEntry[] value = #[]
}

@Documented
@Retention(RUNTIME)
@Target(#[TYPE, METHOD])
@Inherited
@Repeatable(BuildImageContent)
annotation BuildImageContentEntry {
    String name = ''
    String value = ''
}
