cask "binlogviz" do
  version "0.23.28"

  on_macos do
    on_intel do
      sha256 "dd344388fa52f629e691ba788dd54a12626c105b76c320590bad47b592f5e799"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.28/binlogviz_0.23.28_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "402a2d05567941439fa3bb03b86b395ddfa4a5844df36c1d7ca6740dc92f4911"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.28/binlogviz_0.23.28_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "e949448f1bcc66c24972938aad74dcd0ab5138d455acf744bdbd90eb3517a6b7"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.28/binlogviz_0.23.28_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "7f7e65df46e823c5375d37b124b9c5ebd7e374176a3043d8b628f4824eccaa4b"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.28/binlogviz_0.23.28_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
