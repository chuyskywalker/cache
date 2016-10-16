job "cache" {
    type = "service"
    datacenters = [ "dc1" ]
    task "cache" {
        driver = "docker"
        config {
            image = "{image}"
        }
        resources {
            memory = 512
            cpu = 1000
        }
    }
}
