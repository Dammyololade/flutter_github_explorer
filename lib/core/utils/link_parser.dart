
/// A utility class to parse the link header from the response.
/// The link header is a string that contains the links to the next and previous pages.
/// The link header is in the format of <url>; rel="next", <url>; rel="prev" and so on.
/// This class parses the link header and returns a map of the links.
/// The key is the rel value and the value is the url.
/// For example, if the link header is '<https://api.github.com/user/repos?page=3&per_page=100>; rel="next", <https://api.github.com/user/repos?page=1&per_page=100>; rel="prev"',
class LinkParser {
  static Map<String, String> parseLinkHeader(String input) {
    final out = <String, String>{};
    final parts = input.split(', ');
    for (final part in parts) {
      final kv = part.split('; ');
      var url = kv[0].substring(1);
      url = url.substring(0, url.length - 1);
      var key = kv[1];
      key = key.replaceAll('"', '').substring(4);
      out[key] = url;
    }
    return out;
  }
}
