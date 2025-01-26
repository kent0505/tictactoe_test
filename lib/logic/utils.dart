int getY(List<int> ids, int x) {
  if (ids[0] == x && ids[1] == x && ids[2] == 0) return 2;
  if (ids[3] == x && ids[4] == x && ids[5] == 0) return 5;
  if (ids[6] == x && ids[7] == x && ids[8] == 0) return 8;
  if (ids[2] == x && ids[1] == x && ids[0] == 0) return 0;
  if (ids[5] == x && ids[4] == x && ids[3] == 0) return 3;
  if (ids[8] == x && ids[7] == x && ids[6] == 0) return 6;
  if (ids[0] == x && ids[3] == x && ids[6] == 0) return 6;
  if (ids[1] == x && ids[4] == x && ids[7] == 0) return 7;
  if (ids[2] == x && ids[5] == x && ids[8] == 0) return 8;
  if (ids[6] == x && ids[3] == x && ids[0] == 0) return 0;
  if (ids[7] == x && ids[4] == x && ids[1] == 0) return 1;
  if (ids[8] == x && ids[5] == x && ids[2] == 0) return 2;
  if (ids[0] == x && ids[4] == x && ids[8] == 0) return 8;
  if (ids[2] == x && ids[4] == x && ids[6] == 0) return 6;
  if (ids[6] == x && ids[4] == x && ids[2] == 0) return 2;
  if (ids[8] == x && ids[4] == x && ids[0] == 0) return 0;
  if (ids[0] == x && ids[2] == x && ids[1] == 0) return 1;
  if (ids[0] == x && ids[6] == x && ids[3] == 0) return 3;
  if (ids[2] == x && ids[8] == x && ids[5] == 0) return 5;
  if (ids[8] == x && ids[6] == x && ids[7] == 0) return 7;
  if (ids[4] == 0) return 4;
  for (int i = 0; i < ids.length; i++) {
    if (ids[i] == 0) return i;
  }
  return 0;
}
