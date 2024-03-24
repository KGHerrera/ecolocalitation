function msg_stop() {
    // Reiniciar las variables relacionadas con el mensaje si existen
    if (variable_instance_exists(id, "char")) char = 0;
    if (variable_instance_exists(id, "line")) line = 0;
}