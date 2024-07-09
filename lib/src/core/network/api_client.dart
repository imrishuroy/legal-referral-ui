import 'dart:io';

import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/chat/data/data.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class APIClient {
  factory APIClient(
    Dio dio, {
    String? baseUrl,
  }) = _APIClient;

  @GET('/')
  Future<String> ping();

  @POST('/custom-signup')
  Future<String?> customSignUp(
    @Body() AppUser appUser,
  );

  @POST('/users')
  @MultiPart()
  Future<AppUser?> createUser({
    @Part(name: 'email') required String email,
    @Part(name: 'first_name') required String firstName,
    @Part(name: 'last_name') required String lastName,
    @Part(name: 'signup_method') required int signUpMethod,
    @Part(name: 'mobile') String? mobile,
    @Part(name: 'image_url') String? imageUrl,
    @Part(name: 'user_image') File? userImage,
  });

  @POST('/sign-up')
  Future<AppUser?> signUp(
    @Body() AppUser appUser,
  );

  @POST('/sign-in')
  Future<AppUser?> signIn(
    @Body() SignInReq signInReq,
  );

  @POST('/sign-in/linkedin')
  Future<LinkedinSignInRes?> signInWithLinkedIn(
    @Body() LinkedinSignInReq signInWithLinkedInReq,
  );

  @POST('/reset-password')
  Future<ResponseMsg?> resetPassword(
    @Body() ResetPasswordReq resetPasswordReq,
  );

  @GET('/users/{userId}')
  Future<AppUser?> getUser(
    @Path('userId') String userId,
  );

  @GET('/users/{userId}/wizardstep')
  Future<int?> getWizardStep(
    @Path('userId') String userId,
  );

  @POST('/otp/send')
  Future<ResponseMsg?> sendOtp(
    @Body() SendOtpReq sendOtpReq,
  );

  @POST('/otp/verify')
  Future<ResponseMsg?> verifyOtp(
    @Body() VerifyOtpReq verifyOtpReq,
  );

  @PUT('/user')
  Future<AppUser?> updateUser(
    @Body() AppUser appUser,
  );

  @POST('/license')
  Future<License?> saveLicense(
    @Body() License license,
  );

  @POST('/license/upload')
  @MultiPart()
  Future<ResponseMsg?> uploadLicense(
    @Part(name: 'file') File file,
  );

  @POST('/about-you')
  Future<ResponseMsg?> saveAboutYou(
    @Body() AboutYouReq aboutYouReq,
  );

  // profile

  @GET('/users/{userId}/profile')
  Future<UserProfile?> fetchUserProfile(
    @Path('userId') String userId,
  );

  @GET('/firms')
  Future<List<Firm?>> searchFirm(
    @Query('query') String query,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @PUT('/users/info')
  Future<AppUser?> uploadUserInfo(
    @Body() UploadUserInfoReq uploadUserInfoReq,
  );

  @POST('/price')
  Future<Price?> addPrice(
    @Body() Price price,
  );

  @PUT('/price/{priceId}')
  Future<Price?> updatePrice(
    @Path('priceId') int priceId,
    @Body() Price price,
  );

  @PUT('/users/{userId}/toggle-referral')
  Future<ResponseMsg?> toggleReferral(
    @Path('userId') String userId,
    @Body() ToggleReferralReq toggleReferralReq,
  );

  @PUT('/users/{userId}/banner')
  @MultiPart()
  Future<String?> updateUserBanner(
    @Path('userId') String userId,
    @Part(name: 'file') File file,
  );

  // profile/socials

  @POST('/socials')
  Future<Social?> addSocial(
    @Body() Social social,
  );

  @GET('/socials/{entityType}/{entityId}')
  Future<List<Social?>> fetchSocials(
    @Path('entityType') EntityType entityType,
    @Path('entityId') String entityId,
  );

  @PUT('/socials/{socialId}')
  Future<Social?> updateSocial(
    @Path('socialId') int socialId,
    @Body() Social social,
  );

  @DELETE('/socials/{socialId}')
  Future<ResponseMsg?> deleteSocial(
    @Path('socialId') int socialId,
  );

  // profile/experiences
  @POST('/users/{userId}/experiences')
  Future<UserExperience?> addExperience(
    @Path('userId') String userId,
    @Body() AddUpdateExperienceReq addExperienceReq,
  );

  @PUT('/users/{userId}/experiences/{experienceId}')
  Future<UserExperience?> updateExperience(
    @Path('userId') String userId,
    @Path('experienceId') int experienceId,
    @Body() AddUpdateExperienceReq experienceReq,
  );

  @GET('/users/{userId}/experiences')
  Future<List<UserExperience>> fetchExperiences(
    @Path('userId') String userId,
  );

  @DELETE('/users/{userId}/experiences/{experienceId}')
  Future<ResponseMsg?> deleteExperience(
    @Path('userId') String userId,
    @Path('experienceId') int experienceId,
  );

  @PUT('/users/{userId}/avatar')
  @MultiPart()
  Future<String?> updateUserAvatar(
    @Path('userId') String userId,
    @Part(name: 'file') File file,
  );

  // profile/educations

  @POST('/users/{userId}/educations')
  Future<Education?> addEducation(
    @Body() Education education,
  );

  @PUT('/users/{userId}/educations/{educationId}')
  Future<Education?> updateEducation(
    @Path('userId') String userId,
    @Path('educationId') int educationId,
    @Body() Education education,
  );

  @GET('/users/{userId}/educations')
  Future<List<Education>> fetchEducations(
    @Path('userId') String userId,
  );

  @DELETE('/users/{userId}/educations/{educationId}')
  Future<ResponseMsg?> deleteEducation(
    @Path('userId') String userId,
    @Path('educationId') int educationId,
  );

  // network

  @POST('/connections/send')
  Future<ResponseMsg?> sendConnection(
    @Body() SendConnectionReq sendConnectionReq,
  );

  @POST('/connections/{id}/accept')
  Future<Connection?> acceptConnection(
    @Path('id') int id,
  );

  @POST('/connections/{id}/reject')
  Future<ResponseMsg?> rejectConnection(
    @Path('id') int id,
  );

  @GET('/connections/invitations/{userId}')
  Future<List<ConnectionInvitation?>> fetchConnectionInvitations(
    @Path('userId') String userId,
    @Query('offset') int offset,
    @Query('limit') int limit,
  );

  @GET('/connections/{userId}')
  Future<List<Connection?>> fetchConnections(
    @Path('userId') String userId,
    @Query('offset') int offset,
    @Query('limit') int limit,
  );

  @GET('/recommendations/{userId}')
  Future<List<Recommendation?>> fetchRecommendations(
    @Path('userId') String userId,
    @Query('offset') int offset,
    @Query('limit') int limit,
  );

  @POST('/recommendations/cancel')
  Future<ResponseMsg?> cancelRecommendation(
    @Body() CancelRecommendationReq cancelRecommendationReq,
  );

  @GET('/connections/{userId}/{otherUserId}')
  Future<UserConnectionStatus> checkConnection(
    @Path('userId') String userId,
    @Path('otherUserId') String otherUserId,
  );

  // search
  @GET('/search/users')
  Future<List<AppUser?>> searchUsers(
    @Query('query') String query,
    @Query('filter') String filter,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  // chat
  @GET('/chat/{room_id}/messages')
  Future<List<ChatMessage>> fetchMessages(
    @Path('room_id') String roomId,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/chat/rooms')
  Future<ChatRoom> createChatRoom(
    @Body() CreateChatRoomReq createChatRoomReq,
  );

  @GET('/chat/users/{userId}/rooms')
  Future<List<ChatRoom>> fetchChatRooms(
    @Path('userId') String userId,
  );

  // referral
  @POST('/referral')
  Future<String?> createReferral(
    @Body() CreateReferral referral,
  );

  @GET('/referrals/{userId}/active')
  Future<List<Project?>> fetchActiveReferrals(
    @Path('userId') String userId,
  );

  @GET('/referrals/users/{projectId}')
  Future<List<ReferedUser?>> fetchReferredUsers(
    @Path('projectId') int projectId,
  );

  @GET('/users/{userId}/proposals')
  Future<List<Project?>> fetchProposals(
    @Path('userId') String userId,
  );

  @POST('/proposals')
  Future<Proposal?> createProposal(
    @Body() Proposal proposalReq,
  );

  @PUT('/proposals/{proposalId}')
  Future<Proposal> updateProposal(
    @Path('proposalId') int proposalId,
    @Body() Proposal proposal,
  );

  @GET('/users/{userId}/proposals/{projectId}')
  Future<Proposal?> fetchProposalByReferralId(
    @Path('userId') String userId,
    @Path('projectId') int projectId,
  );

  @POST('/projects/award')
  Future<Project?> awardProject(
    @Body() AwardProjectReq awardProject,
  );

  @GET('/projects/awarded/{userId}')
  Future<List<Project?>> fetchAwardedProjects(
    @Path('userId') String userId,
  );
  @PUT('/projects/{projectId}/accept')
  Future<Project?> acceptProject(
    @Path('projectId') int projectId,
  );

  @GET('/projects/active/{userId}')
  Future<List<Project?>> fetchActiveProjects(
    @Path('userId') String userId,
    @Query('role') String role,
  );

  @PUT('/projects/{projectId}/reject')
  Future<Project?> rejectProject(
    @Path('projectId') int projectId,
  );

  @PUT('/projects/{projectId}/start')
  Future<Project?> startProject(
    @Path('projectId') int projectId,
  );

  @PUT('/projects/{projectId}/initiate-complete')
  Future<Project?> initiateCompleteProject(
    @Path('projectId') int projectId,
  );

  @PUT('/projects/{projectId}/cancel/initiate-complete')
  Future<Project?> cancelInitiateCompleteProject(
    @Path('projectId') int projectId,
  );

  @PUT('/projects/{projectId}/complete')
  Future<Project?> completeProject(
    @Path('projectId') int projectId,
  );

  @POST('/projects/review')
  Future<ProjectReview?> addProjectReview(
    @Body() ProjectReview projectReview,
  );

  @GET('/projects/completed/{userId}')
  Future<List<Project?>> fetchCompletedProjects(
    @Path('userId') String userId,
    @Query('role') String role,
  );

  @GET('/users/{userId}/connected')
  Future<List<AppUser?>> fetchConnectedUsers(
    @Path('userId') String userId,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @GET('/users')
  Future<List<AppUser?>> fetchUsers(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/posts')
  @MultiPart()
  Future<String?> createPost(
    @Part(name: 'owner_id') String ownerId,
    @Part(name: 'content') String content,
    @Part(name: 'post_type') String type,
    @Part(name: 'files') List<File> files,
  );

  // feed
  @GET('/feeds/{userId}')
  Future<List<Feed?>> fetchFeeds(
    @Path('userId') String userId,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/posts/{postId}/like')
  Future<void> likePost(
    @Path('postId') int postId,
  );

  @DELETE('/posts/{postId}/like')
  Future<void> unlikePost(
    @Path('postId') int postId,
  );

  @GET('/posts/{postId}/liked-users')
  Future<List<AppUser?>> fetchPostLikedUsers(
    @Path('postId') int postId,
  );

  @POST('/posts/{postId}/comments')
  Future<Comment> commentPost(
    @Path('postId') int postId,
    @Body() CommentReq commentReq,
  );

  @GET('/posts/{postId}/comments')
  Future<List<Comment?>> fetchPostComments(
    @Path('postId') int postId,
  );

  @POST('/comments/{commentId}/like')
  Future<void> likeComment(
    @Path('commentId') int commentId,
  );

  @DELETE('/comments/{commentId}/like')
  Future<void> unlikeComment(
    @Path('commentId') int commentId,
  );

  // discussion
  @POST('/discussions')
  Future<Discussion?> createDiscussion(
    @Body() CreateDiscussionReq discussion,
  );

  @POST('/discussions/{discussionId}/invite')
  Future<ResponseMsg?> inviteUserToDiscussion(
    @Path('discussionId') String discussionId,
    @Body() InviteUserToDiscussionReq inviteDiscussionReq,
  );

  @GET('/discussions/active/{userId}')
  Future<List<Discussion?>> fetchActiveDiscussions(
    @Path('userId') String userId,
  );

  @GET('/discussions/invites/{userId}')
  Future<List<DiscussionInviteRes?>> fetchDiscussionInvites(
    @Path('userId') String userId,
  );

  @POST('/discussions/{discussionId}/messages')
  Future<DiscussionMessage?> sendMessageToDiscussion(
    @Path('discussionId') int discussionId,
    @Body() DiscussionMessage message,
  );

  @GET('/discussions/{discussionId}/messages')
  Future<List<DiscussionMessage>> fetchDiscussionMessages(
    @Path('discussionId') int discussionId,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/discussions/{discussionId}/join')
  Future<ResponseMsg> joinDiscussion(
    @Path('discussionId') int discussionId,
  );

  @POST('/discussions/{discussionId}/reject')
  Future<ResponseMsg> rejectDiscussion(
    @Path('discussionId') int discussionId,
  );

  @GET('/discussions/{discussionId}/participants')
  Future<List<AppUser?>> fetchDiscussionParticipants(
    @Path('discussionId') int discussionId,
  );
}
