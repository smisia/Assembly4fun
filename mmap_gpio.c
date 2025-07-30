#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define GPIO_BASE 0xFE200000
#define BLOCK_SIZE 4096

extern void gpio_control(void *gpio_base_addr);
int main(){
	int mem_fd;
	void *gpio_map;

	if((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0){
	 printf("Nem sikerult megnyitni a /dev/mem-t.\n");
	 return -1;
	}

	gpio_map = mmap(NULL, BLOCK_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, GPIO_BASE);
	
	if(gpio_map == MAP_FAILED){
	 printf("mmap hiba \n");
	 close(mem_fd);
	 return -1;
	}

	gpio_control(gpio_map);

	munmap((void *)gpio_map, BLOCK_SIZE);
	close(mem_fd);

	return 0;
}
