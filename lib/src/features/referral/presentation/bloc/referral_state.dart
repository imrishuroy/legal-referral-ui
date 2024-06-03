part of 'referral_bloc.dart';

enum ReferralStatus {
  initial,
  loading,
  success,
  failure,
  referralAdded,
  awardProject,
  chatRoomCreated,
}

class ReferralState extends Equatable {
  const ReferralState({
    required this.status,
    this.referrals = const [],
    this.referConnection = true,
    this.users = const [],
    this.selectedUsers = const [],
    this.referredUsers = const [],
    this.proposalsProjects = const [],
    this.proposal,
    this.activeProjects = const [],
    this.awardedProjects = const [],
    this.isProposalEditing = false,
    this.completedProjects = const [],
    this.chatRoom,
    this.tabIndex = 0,
    this.isReset = false,
    this.failure,
  });

  factory ReferralState.initial() {
    return const ReferralState(
      status: ReferralStatus.initial,
    );
  }

  final List<Project?> referrals;
  final bool referConnection;
  final List<AppUser?> users;
  final List<AppUser?> selectedUsers;
  final List<ReferedUser?> referredUsers;
  final List<Project?> proposalsProjects;
  final Proposal? proposal;
  final bool isProposalEditing;
  final List<Project?> activeProjects;
  final List<Project?> awardedProjects;
  final List<Project?> completedProjects;
  final ChatRoom? chatRoom;
  final int tabIndex;
  final bool isReset;

  final ReferralStatus status;
  final Failure? failure;

  ReferralState copyWith({
    List<Project?>? referrals,
    bool? referConnection,
    List<AppUser?>? users,
    List<AppUser?>? selectedUsers,
    List<Connection?>? connections,
    List<Connection?>? selectedConnections,
    List<ReferedUser?>? referredUsers,
    List<Project?>? proposalsProjects,
    Proposal? proposal,
    bool? isProposalEditing,
    List<Project?>? activeProjects,
    List<Project?>? awardedProjects,
    List<Project?>? completedProjects,
    ChatRoom? chatRoom,
    int? tabIndex,
    bool? isReset,
    ReferralStatus? status,
    Failure? failure,
  }) {
    return ReferralState(
      referrals: referrals ?? this.referrals,
      referConnection: referConnection ?? this.referConnection,
      users: users ?? this.users,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      referredUsers: referredUsers ?? this.referredUsers,
      proposalsProjects: proposalsProjects ?? this.proposalsProjects,
      proposal: proposal ?? this.proposal,
      isProposalEditing: isProposalEditing ?? this.isProposalEditing,
      activeProjects: activeProjects ?? this.activeProjects,
      awardedProjects: awardedProjects ?? this.awardedProjects,
      completedProjects: completedProjects ?? this.completedProjects,
      chatRoom: chatRoom ?? this.chatRoom,
      tabIndex: tabIndex ?? this.tabIndex,
      isReset: isReset ?? this.isReset,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        referrals,
        referConnection,
        users,
        selectedUsers,
        referredUsers,
        proposalsProjects,
        proposal,
        isProposalEditing,
        activeProjects,
        awardedProjects,
        completedProjects,
        chatRoom,
        tabIndex,
        isReset,
        status,
        failure,
      ];
}
