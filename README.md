
# ENCS4310 Digital Signal Processing Project

## Project Title

Line Echo Cancellation.

## Project Description

In telecommunication systems, signals transmitted from a far end to a near end often result in echoes due to impedance mismatches in the hybrid circuits. These echoes can degrade the quality of the communication experience by superimposing a delayed and attenuated version of the original signal back to the speaker.

This project aims to design and implement an adaptive Line Echo Canceller (LEC) that can effectively cancel out this echo, thereby enhancing the voice quality on both ends.

## Objectives

1. **Echo Path Modeling:**
   - Load and analyze the impulse response of the echo path (`path.mat`).
   - Plot both the impulse and frequency responses.

2. **Signal Analysis:**
   - Work with a composite source signal (`css.mat`) that emulates speech characteristics.
   - Analyze and plot its waveform and Power Spectrum Density (PSD).

3. **Echo Signal Generation:**
   - Simulate the echo by feeding the signal through the echo path.
   - Analyze and compare the input and output powers to evaluate the Echo Return Loss (ERL).

4. **Adaptive Echo Canceller Implementation:**
   - Implement an adaptive Line Echo Canceller using the Normalized Least Mean Squares (NLMS) algorithm.
   - Evaluate its performance by plotting the error signals and comparing the estimated echo path with the actual one.

5. **System Identification and Analysis:**
   - Further explore adaptive algorithms for system identification.
   - Analyze and plot the amplitude and phase response of the estimated system.

## Tools and Technologies

- **MATLAB:** Recommended due to their extensive libraries and tools for DSP.


## Contributors

- [Mohammad AbuShams](https://github.com/MohammadAbuShams)
- [Yazeed Hamdan](https://github.com/YazeedHamdan1201133)
- [Mahmoud Hamdan](https://github.com/MahmoudHamdan8)


