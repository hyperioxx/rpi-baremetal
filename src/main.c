#define UART0_BASE 0x3F201000 // for Raspberry Pi 2/3/4

#define UART0_DR ((volatile unsigned int*)(UART0_BASE + 0x00)) // Data Register
#define UART0_FR ((volatile unsigned int*)(UART0_BASE + 0x18)) // Flag Register

#define UART_FR_TXFF (1 << 5) // Transmit FIFO full flag

void send(const char *s) {
    while (*s) {
        // Wait for UART to become ready to transmit
        while (*UART0_FR & UART_FR_TXFF) { } // Wait until transmit FIFO is not full
        *UART0_DR = (unsigned int)(*s); // Transmit char
        s++; // Next char
    }
}

int main(void) {
    // UART initialization code should be here (not shown)

    for (int i = 0; i < 10; i++) {
        send("Hello\n");
    }

    // Busy-wait loop to prevent the program from terminating
    while (1) { }

    return 0;
}

