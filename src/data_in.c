#include<stdio.h>
#include<math.h>
void main()
{
 int i ;
 int data;
 FILE *fp;
if(( fp=fopen("fir_in.txt","w"))==NULL)
{
 printf("error");
 exit(0);
}
for(i=0;i<1024;i++)
   {  data=(int)
	  ( (sin(2*3.1415926*i/16)+ sin(2*3.1415926*i/3.2 ) )*16383);
	    data &=0x0000ffff;//16bit
	fprintf(fp,"%x\n",data);
    }
  fclose(fp);
}