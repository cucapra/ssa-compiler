
void *init();
void *call_partitioned_functions(int num_functions, 
    void (**function_pts)(void *), void *context);
void join_partitioned_functions(int num_functions, void *threads_arg);

void send(void *value, int size, int to_core, int64_t addr, void *context);
void *receive(int size, int from_core, int64_t addr, void *context);
void free_comms(int64_t addr, int size, void *context);

void send_argument(void *value, int size, int to_core, int64_t addr, void *context);
void *receive_argument(int size, int64_t addr, void *context);

void send_return(void *value, int size, void *context);
void *receive_return(int size, void *context);

void send_token(int to_core, int64_t addr, void *context);
void receive_token(int64_t addr, void *context);