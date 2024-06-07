import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    required this.imageUrl,
    super.key,
    this.radius = 20.0,
    this.backgroundColor,
  });
  final String? imageUrl;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final image = imageUrl != null
        ? NetworkImage(imageUrl!)
        : const AssetImage(
            IconStringConstants.avatarPlaceholder,
          );
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.grey,
      child: ClipOval(
        child: FadeInImage(
          placeholder: const AssetImage(
            IconStringConstants.avatarPlaceholder,
          ),
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: radius * 2,
          height: radius * 2,
          fadeInDuration: const Duration(
            milliseconds: 300,
          ),
          fadeOutDuration: const Duration(
            milliseconds: 100,
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:image_network/image_network.dart';
// import 'package:legal_referral_ui/src/core/constants/constants.dart';

// class CustomAvatar extends StatelessWidget {
//   const CustomAvatar({
//     required this.imageUrl,
//     super.key,
//     this.radius = 20.0,
//   });
//   final String? imageUrl;
//   final double radius;

//   @override
//   Widget build(BuildContext context) {
//     // final image = imageUrl != null
//     //     ? NetworkImage(imageUrl!)
//     //     : const AssetImage(
//     //         ImageStringConstants.avatarPlaceholder,
//     //       );

//     return CircleAvatar(
//       radius: radius,
//       backgroundColor: Colors.grey,
//       child: ClipOval(
//         child: imageUrl == null
//             ? Image.asset(
//                 ImageStringConstants.avatarPlaceholder,
//                 fit: BoxFit.cover,
//                 width: radius * 2,
//                 height: radius * 2,
//               )
//             : ImageNetwork(
//                 image: imageUrl!,
//                 width: radius * 2,
//                 height: radius * 2,
//                 // duration: 1500,
//                 duration: 100,
//                 curve: Curves.decelerate,

//                 // onPointer: true,
//                 onLoading: FadeInImage(
//                   placeholder: const AssetImage(
//                     ImageStringConstants.avatarPlaceholder,
//                   ),
//                   image: NetworkImage(imageUrl!),
//                   fit: BoxFit.cover,
//                   width: radius * 2,
//                   height: radius * 2,
//                   fadeInDuration: const Duration(
//                     milliseconds: 100,
//                   ),
//                   fadeOutDuration: const Duration(
//                     milliseconds: 100,
//                   ),
//                 ),

//                 // const CircularProgressIndicator(
//                 //   color: Colors.indigoAccent,
//                 // ),
//                 onError: const Icon(
//                   Icons.error,
//                   color: Colors.red,
//                 ),
//               ),
//         // child: FadeInImage(
//         //   placeholder: const AssetImage(
//         //     ImageStringConstants.avatarPlaceholder,
//         //   ),
//         //   image: image as ImageProvider,
//         //   fit: BoxFit.cover,
//         //   width: radius * 2,
//         //   height: radius * 2,
//         //   fadeInDuration: const Duration(
//         //     milliseconds: 300,
//         //   ),
//         //   fadeOutDuration: const Duration(
//         //     milliseconds: 100,
//         //   ),
//         // ),
//       ),
//     );
//   }
// }
