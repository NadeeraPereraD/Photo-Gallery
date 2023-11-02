class MyImage {
  late int m_id;
  late String m_imagePath;
  static int s_globalId = 0;
  bool isDeleted = false;

  MyImage(this.m_imagePath) {
    m_id = s_globalId + 1;
    s_globalId++;
  }
}
