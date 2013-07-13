#ifndef URG_RING_BUFFER_H
#define URG_RING_BUFFER_H

#ifdef __cplusplus
extern "C"
{
#endif


typedef struct
{
    char *buffer;
    int buffer_size;
    int first;
    int last;
} ring_buffer_t;


extern void ring_initialize(ring_buffer_t *ring,
                            char *buffer, const int shift_length);

extern void ring_clear(ring_buffer_t *ring);


extern int ring_size(const ring_buffer_t *ring);


extern int ring_capacity(const ring_buffer_t *ring);


extern int ring_write(ring_buffer_t *ring, const char *data, int size);

extern int ring_read(ring_buffer_t *ring, char *buffer, int size);

#ifdef __cplusplus
}
#endif

#endif /* ! RING_BUFFER_H */
