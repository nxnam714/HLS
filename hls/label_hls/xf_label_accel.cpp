#include "xf_label_config.h"

void xfMat2axis (xf::Mat<TYPE_OUT, HEIGHT, WIDTH, NPC1> &_dst, axis_out_t *dst, int rows, int cols) {
#pragma HLS inline off

	for (int i=0; i<rows; i++) {
		for (int j=0; j<cols; j++) {
#pragma HLS pipeline
#pragma HLS loop_flatten off
			ap_uint<1> tmp = 0;
			if ((i==rows-1) && (j== cols-1)) {
				tmp = 1;
			}
			dst[i*cols+j].last = tmp;
			dst[i*cols+j].data = _dst.data[i*cols+j];
		}
	}
}
bool push(xf::Point pt, xf::Point *data, int &rear, int &cap)
{
	if (cap == MAX_QUEUE)
	{
	    return false;
	}
	else
	{
		data[rear] = pt;
		rear = (rear+1) % MAX_QUEUE;
		cap++;
	    return true;
	}
}

xf::Point pop(xf::Point *data, int &front, int &cap)
{
	xf::Point pt = data[front];
	front = (front+1) % MAX_QUEUE;
	cap--;
    return pt;
}

bool isEmpty(int front, int rear)
{
    return (front == rear);
}

void hw_label_accel (axis_in_t *src, axis_out_t *dst, int rows, int cols) {

#pragma HLS INTERFACE axis port=src depth=384*288 // Added depth for C/RTL cosimulation
#pragma HLS INTERFACE axis port=dst depth=384*288 // Added depth for C/RTL cosimulation
#pragma HLS INTERFACE s_axilite port=rows
#pragma HLS INTERFACE s_axilite port=cols
#pragma HLS INTERFACE s_axilite port=return

	xf::Mat<TYPE_OUT, HEIGHT, WIDTH, NPC1> base(rows, cols);

#pragma HLS dataflow

	//Tien xu ly du lieu
	for (int i = 0; i < rows*cols - 1; i++){
		base.data[i] = src[i].data;
		if (base.data[i] != 255)
			//Neu diem co gia tri nen, gan ve 0.
			base.data[i] = 0;
		else
			//Neu diem co gia tri thì ummark.
			base.data[i] = 65535;
	}
	//Khoi tao quque rong ban dau
	int front = 0, rear = 0, cap = 0;
	xf::Point mQueue[MAX_QUEUE];

	int numberofObjects = 0;

	//Quet qua toan bo anh mot lan
	for (int i = 0; i < rows; i++){
		for (int j = 0; j < cols; j++){
			if (base.data[i*cols + j] == 65535){

				//Tang so nhan len mot don vi
				numberofObjects++;
				base.data[i*cols + j] = numberofObjects;

				push(xf::Point(i,j), mQueue, rear, cap);
				while (cap > 0){
					xf::Point pt = pop(mQueue, front, cap);
					int x = pt.x;
					int y = pt.y;

					//Goc tren ben trai: 3 hang xom
					if (x*cols + y == 0){
						if (base.data[1] == 65535){
							push(xf::Point(0,1), mQueue, rear, cap);
							base.data[1] = numberofObjects;
						}
						if (base.data[cols] == 65535){
							push(xf::Point(1,0), mQueue, rear, cap);
							base.data[cols] = numberofObjects;
						}
						if (base.data[cols + 1] == 65535){
							push(xf::Point(1,1), mQueue, rear, cap);
							base.data[cols + 1] = numberofObjects;
						}
					}

					//Goc tren ben phai: 3 hang xom
					if (x*cols + y == cols - 1){
						if (base.data[cols - 2] == 65535){
							push(xf::Point(0,cols - 2), mQueue, rear, cap);
							base.data[cols - 2] = numberofObjects;
						}
						if (base.data[2*cols - 2] == 65535){
							push(xf::Point(1,cols - 2), mQueue, rear, cap);
							base.data[2*cols - 2] = numberofObjects;
						}
						if (base.data[2*cols - 1] == 65535){
							push(xf::Point(1,cols - 1), mQueue, rear, cap);
							base.data[2*cols - 1] = numberofObjects;
						}
					}

					//Goc duoi ben trai: ba hang xom
					if (x*cols + y == (rows - 1) * cols){
						if (base.data[(rows - 1)*cols + 1] == 65535){
							push(xf::Point((rows - 1), 1), mQueue, rear, cap);
							base.data[(rows - 1)*cols + 1] = numberofObjects;
						}
						if (base.data[(rows - 2)*cols] == 65535){
							push(xf::Point((rows - 2), 0), mQueue, rear, cap);
							base.data[(rows - 2)*cols] = numberofObjects;
						}
						if (base.data[(rows - 2)*cols + 1] == 65535){
							push(xf::Point((rows - 2), 1), mQueue, rear, cap);
							base.data[(rows - 2)*cols + 1] = numberofObjects;
						}
					}

					//Goc duoi ben phai: ban hang xom
					if (x*cols + y == rows*cols - 1){
						if (base.data[rows*cols - 2] == 65535){
							push(xf::Point(rows - 1, cols - 2), mQueue, rear, cap);
							base.data[rows*cols - 2] = numberofObjects;
						}
						if (base.data[(rows - 1)*cols - 2] == 65535){
							push(xf::Point((rows - 2), cols - 2), mQueue, rear, cap);
							base.data[(rows - 1)*cols - 2] = numberofObjects;
						}
						if (base.data[(rows - 1)*cols - 1] == 65535){
							push(xf::Point((rows - 2), cols - 1), mQueue, rear, cap);
							base.data[(rows - 1)*cols - 1] = numberofObjects;
						}
					}

					//Canh tren: 5 hang xom
					if (x == 0 && y > 0 && y < (cols - 1)){
						if (base.data[y - 1] == 65535){
							push(xf::Point(0, y - 1), mQueue, rear, cap);
							base.data[y - 1] = numberofObjects;
						}
						if (base.data[y + 1] == 65535){
							push(xf::Point(0, y + 1), mQueue, rear, cap);
							base.data[y + 1] = numberofObjects;
						}
						if (base.data[cols + y - 1] == 65535){
							push(xf::Point(1, y - 1), mQueue, rear, cap);
							base.data[cols + y - 1] = numberofObjects;
						}
						if (base.data[cols + y] == 65535){
							push(xf::Point(1, y), mQueue, rear, cap);
							base.data[cols + y] = numberofObjects;
						}
						if (base.data[cols + y + 1] == 65535){
							push(xf::Point(1, y + 1), mQueue, rear, cap);
							base.data[cols + y + 1] = numberofObjects;
						}
					}

					//Canh duoi: 5 hang xom
					if (x == (rows - 1) && y > 0 && y < (cols - 1)){
						if (base.data[x*cols + y - 1] == 65535){
							push(xf::Point(x, y - 1), mQueue, rear, cap);
							base.data[x*cols + y - 1] = numberofObjects;
						}
						if (base.data[x*cols + y + 1] == 65535){
							push(xf::Point(x, y + 1), mQueue, rear, cap);
							base.data[x*cols + y + 1] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + y - 1] == 65535){
							push(xf::Point(x - 1, y - 1), mQueue, rear, cap);
							base.data[(x - 1)*cols + y - 1] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + y] == 65535){
							push(xf::Point(x - 1, y), mQueue, rear, cap);
							base.data[(x - 1)*cols + y] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + y + 1] == 65535){
							push(xf::Point(x - 1, y + 1), mQueue, rear, cap);
							base.data[(x - 1)*cols + y + 1] = numberofObjects;
						}
					}

					//Canh phai: 5 hang xom
					if (y == 0 && x > 0 && x < (rows - 1)){
						if (base.data[(x - 1)*cols] == 65535){
							push(xf::Point(x - 1, 0), mQueue, rear, cap);
							base.data[(x - 1)*cols] = numberofObjects;
						}
						if (base.data[(x + 1)*cols] == 65535){
							push(xf::Point(x + 1, 0), mQueue, rear, cap);
							base.data[(x + 1)*cols] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + 1] == 65535){
							push(xf::Point(x - 1, 1), mQueue, rear, cap);
							base.data[(x - 1)*cols + 1] = numberofObjects;
						}
						if (base.data[x*cols + 1] == 65535){
							push(xf::Point(x, 1), mQueue, rear, cap);
							base.data[x*cols + 1] = numberofObjects;
						}
						if (base.data[(x + 1)*cols + 1] == 65535){
							push(xf::Point(x + 1, 1), mQueue, rear, cap);
							base.data[(x + 1)*cols + 1] = numberofObjects;
						}
					}

					//Canh trai: 5 hang xom
					if (y == (cols - 1) && x > 0 && x < (rows - 1)){
						if (base.data[(x - 1)*cols + y] == 65535){
							push(xf::Point(x - 1, y), mQueue, rear, cap);
							base.data[(x - 1)*cols + y] = numberofObjects;
						}
						if (base.data[(x + 1)*cols + y] == 65535){
							push(xf::Point(x + 1, y), mQueue, rear, cap);
							base.data[(x + 1)*cols + y] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + y - 1] == 65535){
							push(xf::Point(x - 1, y - 1), mQueue, rear, cap);
							base.data[(x - 1)*cols + y - 1] = numberofObjects;
						}
						if (base.data[x*cols + y - 1] == 65535){
							push(xf::Point(x, y - 1), mQueue, rear, cap);
							base.data[x*cols + y - 1] = numberofObjects;
						}
						if (base.data[(x + 1)*cols + y - 1] == 65535){
							push(xf::Point(x + 1, y - 1), mQueue, rear, cap);
							base.data[(x + 1)*cols + y - 1] = numberofObjects;
						}
					}

					//Nam giua: 8 hang xom
					if (x > 0 && x < (rows - 1) && y > 0 && y < (cols - 1)){
						if (base.data[(x - 1)*cols + y - 1] == 65535){
							push(xf::Point(x - 1, y - 1), mQueue, rear, cap);
							base.data[(x - 1)*cols + y - 1] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + y] == 65535){
							push(xf::Point(x - 1, y), mQueue, rear, cap);
							base.data[(x - 1)*cols + y] = numberofObjects;
						}
						if (base.data[(x - 1)*cols + y + 1] == 65535){
							push(xf::Point(x - 1, y + 1), mQueue, rear, cap);
							base.data[(x - 1)*cols + y + 1] = numberofObjects;
						}
						if (base.data[x*cols + y - 1] == 65535){
							push(xf::Point(x, y - 1), mQueue, rear, cap);
							base.data[x*cols + y - 1] = numberofObjects;
						}
						if (base.data[x*cols + y + 1] == 65535){
							push(xf::Point(x, y + 1), mQueue, rear, cap);
							base.data[x*cols + y + 1] = numberofObjects;
						}
						if (base.data[(x + 1)*cols + y - 1] == 65535){
							push(xf::Point(x + 1, y - 1), mQueue, rear, cap);
							base.data[(x + 1)*cols + y - 1] = numberofObjects;
						}
						if (base.data[(x + 1)*cols + y] == 65535){
							push(xf::Point(x + 1, y), mQueue, rear, cap);
							base.data[(x + 1)*cols + y] = numberofObjects;
						}
						if (base.data[(x + 1)*cols + y + 1] == 65535){
							push(xf::Point(x + 1, y + 1), mQueue, rear, cap);
							base.data[(x + 1)*cols + y + 1] = numberofObjects;
						}
					}
				}
			}
		}
	}

	//Dua du lieu ra kenh truyen
	xfMat2axis(base, dst, rows, cols);
}
