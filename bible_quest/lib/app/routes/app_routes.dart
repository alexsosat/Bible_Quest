// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const CREATE = _Paths.CREATE;
  static const LECTURES = _Paths.LECTURES;

  static LECTURESBOOKS(String lectureId) => '/lectures/$lectureId/books';
  static LECTURESCHAPTERS(String lectureId, String bookId) =>
      '/lectures/$lectureId/books/$bookId/chapters';
  static LECTURESREAD(String lectureId, String bookId, String chapterId) =>
      '/lectures/$lectureId/books/$bookId/chapters/$chapterId';

  static const GAMES = _Paths.GAMES;
  static const BANNERS = _Paths.BANNERS;
  static const EXCHANGES = _Paths.EXCHANGES;
  static const EQUIPMENT = _Paths.EQUIPMENT;
  static const MISSIONS = _Paths.MISSIONS;
  static const ACHIEVEMENTS = _Paths.ACHIEVEMENTS;
  static const NEWS = _Paths.NEWS;
  static const ABOUT = _Paths.ABOUT;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const LECTURES = '/lectures';
  static const LECTURESBOOKS = '/lectures/:lecture_id/books';
  static const LECTURESCHAPTERS =
      '/lectures/:lecture_id/books/:book_id/chapters';
  static const LECTURESREAD =
      '/lectures/:lecture_id/books/:book_id/chapters/:chapter_id';
  static const GAMES = '/games';
  static const BANNERS = '/banners';
  static const EXCHANGES = '/exchanges';
  static const EQUIPMENT = '/equipment';
  static const MISSIONS = '/missions';
  static const ACHIEVEMENTS = '/achievements';
  static const NEWS = '/news';
  static const ABOUT = '/about';
  static const CREATE = '/create';
}
