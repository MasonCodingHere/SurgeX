set(SRCS
    config.cpp
    http_conn.cpp
    log.cpp
    lst_timer.cpp
    main.cpp
    sql_connection_pool.cpp
    webserver.cpp
)
include_directories(${PROJECT_SOURCE_DIR}/include)

add_executable(SurgeX ${SRCS})

