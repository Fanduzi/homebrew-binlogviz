cask "binlogviz" do
  version "0.23.11"

  on_macos do
    on_intel do
      sha256 "6a75d386ea3dea43f4f724f32965cafeb97c6d9ed9296be10978e11703d76cb4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.11/binlogviz_0.23.11_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "057f8be0fa516a0810e993c025fe5ac8d1cc727000f669cce079352ee9276d68"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.11/binlogviz_0.23.11_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "1dba6b4e8387b3dce09aa604e1852823946b5bb4a15ab3fd11ac622a301525f2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.11/binlogviz_0.23.11_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "90620a72e21e9677cbd6555ad4d858502041796843f694b51859ef6b411a4513"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.11/binlogviz_0.23.11_linux_arm64.tar.gz",
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
