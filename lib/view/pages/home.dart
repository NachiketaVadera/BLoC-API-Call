import 'package:api_call_bloc/bloc/this_for_that/this_for_that_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ThisForThat'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: BlocBuilder<ThisForThatCubit, ThisForThatState>(
                builder: (context, state) {
                  if (state is ThisForThatInitial) {
                    return Text('Click the button to get an idea');
                  } else if (state is ThisForThatLoading) {
                    return CircularProgressIndicator();
                  } else if (state is ThisForThatLoaded) {
                    return Text(
                        'Build ${state.thisForThat.tThis} for ${state.thisForThat.that}');
                  } else if (state is ThisForThatError) {
                    return Text(state.message);
                  } else {
                    return Text('Hmm...Something is not right.');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () =>
                    context.read<ThisForThatCubit>().getThisForThat(),
                child: Text('Generate Idea'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
