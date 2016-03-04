#include <opencv2/opencv.hpp>
#include <iostream>

using namespace std;
using namespace cv;

int main() {
  VideoCapture cap(0);
  if (!cap.isOpened()) {
    cout << "Error opening webcam" << endl;
    return -1;
  }

  int frame_width  = cap.get(CV_CAP_PROP_FRAME_WIDTH);
  int frame_height = cap.get(CV_CAP_PROP_FRAME_HEIGHT);
  VideoWriter video("out.avi", CV_FOURCC('M', 'J', 'P', 'G'), 10, Size(frame_width, frame_height), true);

  for (;;) {
    Mat frame;
    cap >> frame;
    video.write(frame);
    // imshow("Frame", frame);
    if (waitKey(1) == 27) {
      break;
    }
  }
  return 0;
}
