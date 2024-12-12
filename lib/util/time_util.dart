class TimeUtil {

  static String getTimesToAgo({required DateTime dateTime}){
    final difference = DateTime.now().difference(dateTime);
    return _formatDuration(difference) ;

  }
  static String _formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    if (days > 0) {
      return "${days} day${days > 1 ? 's' : ''} ago";
    } else if (hours > 0) {
      return "${hours} hour${hours > 1 ? 's' : ''} and ${minutes} minute${minutes > 1 ? 's' : ''} ago";
    } else if (minutes > 0) {
      return "${minutes} minute${minutes > 1 ? 's' : ''} ago";
    } else {
      return "Just now";
    }
  }
}
