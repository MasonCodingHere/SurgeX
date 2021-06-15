CXX ?= g++

DEBUG ?= 1
ifeq ($(DEBUG), 1)
    CXXFLAGS += -g
else
    CXXFLAGS += -O2

endif

server: ./src/main.cpp  ./src/lst_timer.cpp ./src/http_conn.cpp ./src/log.cpp ./src/sql_connection_pool.cpp  ./src/webserver.cpp ./src/config.cpp
	$(CXX) -o server  $^ $(CXXFLAGS) -lpthread -lmysqlclient

clean:
	rm  -r server
