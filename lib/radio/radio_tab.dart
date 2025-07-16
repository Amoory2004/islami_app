import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/radio/selectedReciter.dart';
import 'package:islami/radio/selected_radio.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool selectedReciters = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedReciters = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: !selectedReciters
                        ? AppTheme.primary
                        : AppTheme.black.withValues(alpha: .7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Radio',
                    style: !selectedReciters
                        ? textTheme.titleMedium!.copyWith(color: AppTheme.black)
                        : textTheme.titleMedium!.copyWith(
                            color: AppTheme.white,
                          ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedReciters = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: selectedReciters
                        ? AppTheme.primary
                        : AppTheme.black.withValues(alpha: .7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Reciters',
                    style: selectedReciters
                        ? textTheme.titleMedium!.copyWith(color: AppTheme.black)
                        : textTheme.titleMedium!.copyWith(
                            color: AppTheme.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          if (selectedReciters)
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Selectedreciter(index: index),
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: 4,
              ),
            ),
          if (!selectedReciters)
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => SelectedRadio(index: index),
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: 4,
              ),
            ),
        ],
      ),
    );
  }
}
