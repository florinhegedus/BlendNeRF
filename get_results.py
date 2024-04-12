
from pathlib import Path
import sys


def get_mean(file_name):
    nums = []
    with open(file_name, 'r') as file:
        for el in file.read().split(' '):
            nums.append(float(el))
    return sum(nums) / len(nums)
 

def get_metrics_for_scene(directory: str):
    files = Path(directory).glob('*')
    for file in files:
        if 'psnr' in str(file):
            print(f"PSNR: {get_mean(str(file))}")
        if 'ssim' in str(file):
            print(f"SSIM: {get_mean(str(file))}")
        if 'lpips' in str(file):
            print(f"LPIPS: {get_mean(str(file))}")
        if 'avg_err' in str(file):
            print(f"AVG_ERR: {get_mean(str(file))}")


if __name__ == '__main__':
    # scenes = ["fern", "flower", "fortress", "leaves", "orchids", "room", "trex"]
    scenes = ["fern", "flower", "fortress"]
    for scene in scenes:
        directory = f"out/blendnerf_llff3_{scene}_wi/test_preds/"
        print("--------------------------")
        print(f"SCENE: {scene}")
        get_metrics_for_scene(directory)
