import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:onest_all_router_app/database/local/database_transfer_service.dart';

class SelectRouterAppbarSection extends StatelessWidget implements PreferredSizeWidget {
  const SelectRouterAppbarSection({super.key});

  void _showImportExportDialog(BuildContext context) {
    final pathController = TextEditingController(
      text: '/sdcard/Download/router_hub_db.sqlite',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Database Backup Tools',
            style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Import database file from local path:',
                style: GoogleFonts.outfit(fontSize: 14, color: const Color(0xFF5E6272)),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: pathController,
                      decoration: InputDecoration(
                        labelText: 'Database File Path',
                        labelStyle: GoogleFonts.outfit(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      style: GoogleFonts.outfit(fontSize: 13),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.folder_open_rounded,
                      color: Color(0xFF2D29D4),
                      size: 24,
                    ),
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      try {
                        final result = await FilePicker.platform.pickFiles();
                        if (result != null && result.files.single.path != null) {
                          pathController.text = result.files.single.path!;
                        }
                      } catch (e) {
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text('File Picker Error: ${e.toString()}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    tooltip: 'Browse Database File',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.download_rounded, size: 18),
                label: Text('Import Database', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D29D4),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async {
                  final path = pathController.text.trim();
                  if (path.isEmpty) return;
                  final navigator = Navigator.of(context);
                  final messenger = ScaffoldMessenger.of(context);
                  try {
                    await DatabaseTransferService.importDatabase(path);
                    navigator.pop();
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('Database imported successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } catch (e) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('Import Error: ${e.toString()}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                icon: const Icon(Icons.upload_rounded, size: 18),
                label: Text('Export Database', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2D29D4),
                  side: const BorderSide(color: Color(0xFF2D29D4)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final messenger = ScaffoldMessenger.of(context);
                  try {
                    final savedPath = await DatabaseTransferService.exportDatabase();
                    navigator.pop();
                    if (!context.mounted) return;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Database Exported', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                        content: Text(
                          'Database successfully copied to:\n\n$savedPath',
                          style: GoogleFonts.outfit(fontSize: 14),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    );
                  } catch (e) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('Export failed: ${e.toString()}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Color(0xFF1B1B1E),
          size: 22,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'STEP 1 OF 3',
            style: GoogleFonts.outfit(
              color: const Color(0xFF2D29D4),
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Choose Your Router',
            style: GoogleFonts.outfit(
              color: const Color(0xFF1B1B1E),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.swap_horizontal_circle_outlined,
            color: Color(0xFF1B1B1E),
            size: 24,
          ),
          onPressed: () => _showImportExportDialog(context),
          tooltip: 'Database Backup Tools',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
