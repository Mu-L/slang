[shader("compute")]
[numthreads(256, 1, 1)]
void computeMain(
    uint gid: SV_GroupID, uint tid: SV_GroupThreadID,
    RWStructuredBuffer<uint>.Handle histogram) {
    if (gid < 1000) {
         histogram[gid] = gid;
    }
}
