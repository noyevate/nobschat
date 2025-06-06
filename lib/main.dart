import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobschat/chat_page.dart';
import 'package:nobschat/core/theme.dart';
import 'package:nobschat/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:nobschat/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nobschat/features/auth/domain/usecases/login_usecase.dart';
import 'package:nobschat/features/auth/domain/usecases/register_uecase.dart';
import 'package:nobschat/features/conversation/data/data_source/conversation_remote_datasource.dart';
import 'package:nobschat/features/conversation/data/repositories/conversation_repository_impl.dart';
import 'package:nobschat/features/conversation/domain/repository/conversation_repository.dart';
import 'package:nobschat/features/conversation/domain/usecase/conversation_usecase.dart';
import 'package:nobschat/features/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:nobschat/features/conversation/presentation/pages/conversation_page.dart';
import 'package:nobschat/login_page.dart';
// import 'package:nobschat/message_page.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nobschat/resgister_page.dart';

void main() {
  final authRepository = AuthRepositoryImpl(authRemoteDatasource: AuthRemoteDatasource());
  final conversationRepository = ConversationRepositoryImpl(conversationRemoteDataSource: ConversationRemoteDataSource());
  runApp( MyApp(authRepositoryImpl: authRepository, conversationRepositoryImpl: conversationRepository,));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepositoryImpl;
  final ConversationRepositoryImpl conversationRepositoryImpl;
  const MyApp({super.key, required this.authRepositoryImpl, required this.conversationRepositoryImpl});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1640),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              registerUsecase: RegisterUsecase(repository: authRepositoryImpl),
              loginUsecase: LoginUsecase(repository: authRepositoryImpl),
            )
          ),

          BlocProvider(
            create: (_) => ConversationBloc(
              fetchConversationUseCase: FetchConversationUseCase(conversationRepositoryImpl)
            )
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'nobschat',
          theme: AppTheme.darkTheme,
          home: ConversationPage(),
          routes: {
            '/login': (_) => LoginPage(),
            '/register': (_) => ResgisterPage(),
            '/chatpage': (_) => ChatPage(),
            '/conversation_page': (_) => ConversationPage(),
          },
        
          // home: TestLogin(),
        ),
      ),
    );
  }
}

