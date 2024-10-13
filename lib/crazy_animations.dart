import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller for managing the button state
class CrazyAnimations extends GetxController {
  var buttonClicked = false.obs; // Reactive variable for button state

  void toggleButton() {
    buttonClicked.value = !buttonClicked.value; // Toggle button state
  }

  void resetButton() {
    buttonClicked.value = false; // Reset button state
  }
}

class CrazyBazy extends StatelessWidget {
  const CrazyBazy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CrazyAnimations()); // Initialize the controller
    var size = MediaQuery.of(context).size; // Get screen size

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.purple,
              Colors.yellow,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding around the screen
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Obx(() => Stack(
                alignment: Alignment.center,
                children: [
                  // Animated Action Button
                  Positioned(
                    bottom: size.height * 0.15, // Position of the button
                    right: size.width * 0.5 - 115, // Centering the button
                    child: GestureDetector(
                      onTap: controller.toggleButton, // Toggle button on tap
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Button padding
                        decoration: BoxDecoration(
                          color: Colors.blue, // Changed button color to blue
                          borderRadius: BorderRadius.circular(36.0), // Changed border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15.0, // Increased shadow blur
                              offset: const Offset(0, 6), // Changed shadow offset
                            ),
                          ],
                        ),
                        child: Text(
                          controller.buttonClicked.value ? "Collapse Circle" : "Expand Circle", // Button text
                          style: TextStyle(
                            fontSize: size.width * 0.05, // Slightly larger font size
                            fontWeight: FontWeight.bold, // Changed to bold
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // First Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500), // Slower animation duration
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value ? size.width * .50 : size.width * .46, // Circle position
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500), // Slower animation duration
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value ? size.width * .80 : size.width * .48, // Circle size
                      height: controller.buttonClicked.value ? size.width * .80 : size.width * .48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: controller.buttonClicked.value
                              ? [Colors.greenAccent, Colors.blueAccent] // Green when expanded
                              : [Colors.blueAccent, Colors.greenAccent], // Original colors when collapsed
                        ),
                        borderRadius: BorderRadius.circular(controller.buttonClicked.value ? 60 : 100), // Different border radius
                      ),
                      child: controller.buttonClicked.value
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.auto_awesome, size: size.width * 0.20, color: Colors.white), // Magic box icon
                            const SizedBox(height: 12),
                            Text(
                              "Ailla Jadu!", // Changed text
                              style: TextStyle(
                                fontSize: size.width * 0.08, // Increased font size
                                fontWeight: FontWeight.bold, // Make it bold
                                color: Colors.brown, // Set color to standard brown
                              ),
                            ),
                          ],
                        ),
                      )
                          : const SizedBox(),
                    ),
                  ),

                  // Second Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500), // Slower animation duration
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value ? size.width * 1.70 : size.width * .521, // Position change
                    left: controller.buttonClicked.value ? 5 : size.width * .265, // Distance from the right
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500), // Animation duration
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value ? size.width * .20 : size.width * .36, // Circle size
                      height: controller.buttonClicked.value ? size.width * .20 : size.width * .36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade500, // Adjusted color shade
                      ),
                      child: controller.buttonClicked.value
                          ? ClipOval(
                        child: Image.asset(
                          'lib/Assets/Images/Ezaz.jpg',
                          fit: BoxFit.cover, // Adjust the fit as necessary
                        ),
                      )
                          : const SizedBox(), // Keep it empty when not clicked
                    ),
                  ),

                  // Third Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500), // Slower animation duration
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value ? 10 : size.width * .566, // Top position change
                    right: size.width * .31, // Circle right position
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500), // Slower animation duration
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value ? size.width * .240 : size.width * .27, // Circle size
                      height: controller.buttonClicked.value ? size.width * .240 : size.width * .27,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orangeAccent,
                            Colors.redAccent, // Changed gradient colors
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: CrazyBazy())); // Main entry point of the app
}
