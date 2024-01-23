import 'package:bloc/bloc.dart';
import 'package:chaty_demo/bloc/user_bloc/user_event.dart';
import 'package:chaty_demo/bloc/user_bloc/user_state.dart';
import 'package:chaty_demo/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc() : super(UserInitial()){
    on<GetCurrentUser>(_onGetCurrentUser);
    on<RegisterUser>(_onRegisterUser);
    on<LoginUser>(_onLoginUser);
  }

  final UserRepository _repository = UserRepository();

  Future<void> _onGetCurrentUser(GetCurrentUser event, Emitter<UserState> emit) async {
    try{
      var user = _repository.getCurrentUser();
      emit(UserLoaded(user: user));
    }catch (exception) {
      print('catche düştü');
    }
  }

  void _onRegisterUser(RegisterUser event, Emitter<UserState> emit) async{
    try{
      await _repository.registerUser(event.user);
      emit(UserLoaded(user: _repository.getCurrentUser()));
    }catch(exception){
       emit(UserError());
      }
    }

  void _onLoginUser(LoginUser event, Emitter<UserState> emit) async{
    try{
      await _repository.loginUser(event.user);
      emit(UserLoaded(user: _repository.getCurrentUser()));
    }catch(exception){
      emit(UserError());
    }
  }
  }
