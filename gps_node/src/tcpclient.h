#ifndef TCPCLIENT_H
#define TCPCLIENT_H


#ifdef __cplusplus
extern "C" {
#endif

#include "ring_buffer.h"
#include <sys/types.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>



// -- NOT INTERFACE, for internal use only --
// For urg_ringbuffer.h
// The size of buffer must be specified by the power of 2
// i.e. ring buffer size = two to the RB_BITSHIFT-th power.
enum {
    RB_BITSHIFT = 8,
    RB_SIZE = 1 << RB_BITSHIFT,

    // caution ! available buffer size is less than the
    // size given to the ring buffer(RB_SIZE).
    BUFSIZE = RB_SIZE - 1,
};


//! TCP/IP connection
typedef struct {
    // socket
    struct sockaddr_in server_addr;
    int sock_desc;
    int sock_addr_size;

    // buffer
    ring_buffer_t rb;
    char buf[RB_SIZE];

    // line reading functions
    int pushed_back; // for pushded back char

} tcpclient_t;
// -- end of NON INTERFACE definitions --


// -- belows are MODULE INTERFACES --
/*!
  \brief constructor of tcp client module

  \param[in,out] cli tcp client type variable which must be allocated by a caller.
  \param[in] server_ip_str IP address expressed in string, i.e. "192.168.0.1"
  \param[in] port_num port number expressed in integer, i.e. port_num = 10200

  \retval 0 succeeded.
  \retval -1 error
*/
extern int tcpclient_open(tcpclient_t* cli,
                          const char* server_ip_str, int port_num);


/*!
  \brief destructor of tcp client module

  \param[in,out] cli : tcp client type variable which must be deallocated by a caller after closing.
*/
extern void tcpclient_close(tcpclient_t* cli);


/*!
  \brief read from socket.

  \param[in,out] cli : tcp client type variable which must be deallocated by a caller after closing.
  \param[out] userbuf : buffer to store read data which must be allocated by a caller.
  \param[in] req_size: data size requested to read in byte.
  \param[in] timeout : time out specification which unit is microsecond.

  \return the number of data read, -1 when error.
*/
extern int tcpclient_read(tcpclient_t* cli,
                          char* userbuf, int req_size, int timeout);


/*!
  \brief write to socket.

  \param[in,out] cli : tcp client type variable which must be deallocated by a caller after closing.
  \param[in] userbuf : data to write.
  \param[in] req_size: data size requested to write in byte.

  \return returns the number of data wrote, -1 when error.
*/
extern int tcpclient_write(tcpclient_t* cli,
                           const char* userbuf, int req_size);


//! \attention not implemented yet.
extern int tcpclient_error(tcpclient_t* cli,
                           char* error_message, int max_size);

extern void tcpclient_buffer_flush(tcpclient_t* cli);

/*!
  \brief read one line from socket.

  \param[in,out] cli : tcp client type variable which must be deallocated by a caller after closing.
  \param[out] userbuf : buffer to store read data which must be allocated by a caller.
  \param[in] buf_size: data size requested to read in byte.
  \param[in] timeout : time out specification which unit is microsecond.

  \return the number of data read, -1 when error.
*/
extern int tcpclient_readline(tcpclient_t* cli,
                              char* userbuf, int buf_size, int timeout);

#ifdef __cplusplus
}
#endif

#endif /* !URG_TCPCLIENT_H */
