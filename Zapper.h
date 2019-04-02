//variables

#pragma bss-name(push, "ZEROPAGE")
unsigned char pad2_zapper;
unsigned char zapper_ready; //wait till it's 0
unsigned char sprid;
unsigned char hit_detected;

unsigned char score1000;
unsigned char score100;
unsigned char score10;
unsigned char score1;

unsigned char star_active;
unsigned char star_color;
unsigned int star_x;
unsigned int star_y;
unsigned int star_x_speed;
unsigned int star_y_speed;
unsigned char star_wait;

unsigned char temp1;
unsigned char temp2;

#pragma bss-name(push, "BSS")


// PROTOTYPES
void move_star(void);
void adjust_score(void);
void new_star(void);
void draw_box(void);
void draw_star(void);

