set(SRCS
    Channel.cpp
    Epoll.cpp
    EventLoop.cpp
    EventLoopThread.cpp
    EventLoopThreadPool.cpp
    HttpData.cpp
    Main.cpp
    Server.cpp
    Timer.cpp
    Util.cpp
)
include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(${PROJECT_SOURCE_DIR}/include/base)


add_executable(SurgeX ${SRCS})
target_link_libraries(SurgeX libserver_base)


add_subdirectory(base)
add_subdirectory(httptests)
