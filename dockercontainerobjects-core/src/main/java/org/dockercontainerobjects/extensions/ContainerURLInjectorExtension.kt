package org.dockercontainerobjects.extensions

import org.dockercontainerobjects.ContainerObjectContext
import org.dockercontainerobjects.util.and
import org.dockercontainerobjects.util.annotatedWith
import org.dockercontainerobjects.util.getAnnotation
import org.dockercontainerobjects.util.ofType
import java.lang.reflect.Field
import java.net.URL

class ContainerURLInjectorExtension: BaseContainerObjectsExtension() {

    companion object {
        const val HOST_DYNAMIC_PLACEHOLDER = "*"
        private val FIELD_SELECTOR = ofType<URL>() and annotatedWith<Field>(URLConfig::class)
    }

    override fun <T: Any> getFieldSelectorOnContainerStarted(ctx: ContainerObjectContext<T>) = FIELD_SELECTOR

    override fun <T: Any> getFieldSelectorOnContainerStopped(ctx: ContainerObjectContext<T>) = FIELD_SELECTOR

    override fun <T: Any> getFieldValueOnContainerStarted(ctx: ContainerObjectContext<T>, field: Field): URL {
        val config = field.getAnnotation<URLConfig>()!!
        val addr: String = ctx.networkSettings?.addresses?.preferred?.hostAddress ?: throw IllegalStateException()
        return if (config.value.isNotEmpty()) {
            URL(config.value.replace(HOST_DYNAMIC_PLACEHOLDER, addr))
        } else {
            URL(config.scheme, addr, config.port, config.path)
        }
    }
}
